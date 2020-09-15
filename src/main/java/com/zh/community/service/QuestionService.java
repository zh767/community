package com.zh.community.service;

import com.zh.community.dto.PaginationDTO;
import com.zh.community.dto.QuestionDTO;
import com.zh.community.dto.QuestionQueryDTO;
import com.zh.community.enums.SortEnum;
import com.zh.community.exception.CustomizeErrorCode;
import com.zh.community.exception.CustomizeException;
import com.zh.community.mapper.QuestionExtMapper;
import com.zh.community.mapper.QuestionMapper;
import com.zh.community.mapper.UserMapper;
import com.zh.community.model.Question;
import com.zh.community.model.QuestionExample;
import com.zh.community.model.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public interface QuestionService {


    PaginationDTO<QuestionDTO> list(String search, String tag, String sort, Integer page, Integer size);

    PaginationDTO<QuestionDTO> list(Long userId, Integer page, Integer size);

    QuestionDTO getById(Long id);

    void createOrUpdate(Question question);

    //增加阅读量 后续优化放到redis里
    void incView(Long id);

    //相关标签问题
    List<QuestionDTO> selectRelated(QuestionDTO queryDTO);
}
