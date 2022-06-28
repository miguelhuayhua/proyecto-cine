/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.miguel.filmproject.dao;

import com.miguel.filmproject.model.Comment;
import java.util.List;

/**
 *
 * @author miguel
 */
public interface commentdao {

    public List<Comment> getCommentsByMovieId(String id);

    public List<Comment> getCommentsByUserId(String id);

    public void insertComment(Comment comment);

    public int getCommentSize();

    public void deleteCommnet(String id, String movieId);

}
