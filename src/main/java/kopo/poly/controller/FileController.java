package kopo.poly.controller;

import kopo.poly.dto.FileUploadDTO;
import kopo.poly.service.FileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.Principal;

@Slf4j
@RestController
@RequiredArgsConstructor
public class FileController {

    private final FileService fileService;

    @PostMapping("/image/upload")
    public FileUploadDTO imageUpload(@RequestPart MultipartFile upload, Principal principal) throws IOException {

        return fileService.fileUpload(upload, principal);
    }
}
