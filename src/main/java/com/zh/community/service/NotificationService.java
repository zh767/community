package com.zh.community.service;

import com.zh.community.dto.NotificationDTO;
import com.zh.community.dto.PaginationDTO;
import com.zh.community.model.User;

public interface NotificationService {


    /**
     * 获取到 用户未读的消息
     *
     * @param userId
     * @param page
     * @param size
     * @return
     */
    PaginationDTO<NotificationDTO> list(Long userId, Integer page, Integer size);

    /**
     * 获取到用户未读的count
     *
     * @param userId
     * @return
     */
    Long unreadCount(Long userId);

    /**
     * 标记一条消息已读
     *
     * @param id
     * @param user
     * @return
     */
    NotificationDTO read(Long id, User user);
}
