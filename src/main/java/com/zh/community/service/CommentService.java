package com.zh.community.service;

import com.zh.community.dto.CommentDTO;
import com.zh.community.enums.CommentTypeEnum;
import com.zh.community.enums.NotificationStatusEnum;
import com.zh.community.enums.NotificationTypeEnum;
import com.zh.community.exception.CustomizeErrorCode;
import com.zh.community.exception.CustomizeException;
import com.zh.community.mapper.*;
import com.zh.community.model.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;


public interface CommentService {

    void insert(Comment comment, User commentator);

    List<CommentDTO> listByTargetId(Long id, CommentTypeEnum type);
}
