package com.example.controller;

import com.example.model.File;
import com.example.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Controller
@RequestMapping("/file")
public class FileController {
    private final Path fileStorageLocation = Paths.get("file_storage").toAbsolutePath().normalize();

    @Autowired
    private FileService fileService;

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file, @RequestParam("filePostId") Long filePostId) {
        try {
            Files.createDirectories(fileStorageLocation);
            Path targetLocation = fileStorageLocation.resolve(file.getOriginalFilename());
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            File dbFile = new File();
            dbFile.setPostId(filePostId);
            dbFile.setFilePath(targetLocation.toString());
            fileService.saveFile(dbFile);
            System.out.println("생성되었습니다.");
            return "redirect:/post/view/" + filePostId;
        } catch (Exception ex) {
            throw new RuntimeException("Could not store file " + file.getOriginalFilename() + ". Please try again!", ex);
        }
    }

    @GetMapping("/download/{fileId}")
    public ResponseEntity<Resource> downloadFile(@PathVariable("fileId") Long fileId) {
        try {
            File dbFile = fileService.getFileById(fileId);
            Path filePath = Paths.get(dbFile.getFilePath()).normalize();
            Resource resource = new UrlResource(filePath.toUri());

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                    .body(resource);
        } catch (Exception ex) {
            throw new RuntimeException("Could not download file. Please try again!", ex);
        }
    }
}


