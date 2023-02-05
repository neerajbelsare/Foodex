package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class trialController {
        @RequestMapping("/trial")
        public String showUploadForm() {
            return "trial";
        }

        @RequestMapping(value = "/uploadimage", method = RequestMethod.POST)
        public String fileupload(@RequestParam("profile") CommonsMultipartFile file) {

            System.out.println("file upload handler");

            System.out.println(file.getSize());

            System.out.println(file.getContentType());

            System.out.println(file.getName());

            System.out.println(file.getOriginalFilename());

            System.out.println(file.getStorageDescription());

            return "Success";
}
}
