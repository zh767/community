package com.zh.community.controller;

import com.zh.community.dto.CommentDTO;
import com.zh.community.dto.QuestionDTO;
import com.zh.community.enums.CommentTypeEnum;
import com.zh.community.exception.CustomizeErrorCode;
import com.zh.community.exception.CustomizeException;
import com.zh.community.service.CommentService;
import com.zh.community.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;


/**
 *  查看问题 本人可以修改
 */
@Controller
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private CommentService commentService;

    @GetMapping("/question/{id}")
    public String question(@PathVariable(name = "id") String id, Model model) {
        Long questionId = null;
        try {
            questionId = Long.parseLong(id);
        } catch (NumberFormatException e) {
            throw new CustomizeException(CustomizeErrorCode.INVALID_INPUT);
        }
        //得到问题
        QuestionDTO questionDTO = questionService.getById(questionId);
        //相关标签问题
        List<QuestionDTO> relatedQuestions = questionService.selectRelated(questionDTO);
        //评论 此处获取到一级评论
        // 这个方法获取到一级或者二级评论 根据评论类型枚举判断
        List<CommentDTO> comments = commentService.listByTargetId(questionId, CommentTypeEnum.QUESTION);
        //累加阅读数
        questionService.incView(questionId);
        model.addAttribute("question", questionDTO);
        model.addAttribute("comments", comments);
        model.addAttribute("relatedQuestions", relatedQuestions);
        return "question";
    }
}
