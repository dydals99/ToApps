package com.example.service;

import com.example.model.File;
import com.example.repository.FileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileService {
    @Autowired
    private FileRepository fileRepository;

    public List<File> getFilesByPostId(Long postId) {
        return fileRepository.findByPostId(postId);
    }

    public File saveFile(File file) {
        return fileRepository.save(file);
    }

    public File getFileById(Long fileId) {
        return fileRepository.findById(fileId).orElse(null);
    }
}
