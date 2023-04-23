package jhu.petstore.util;

import org.apache.commons.codec.digest.DigestUtils;

import java.io.IOException;

public class Util {
    // Help encrypt the user password before save to the database
    public static String encryptPassword(String email, String password) throws IOException {
        return DigestUtils.md5Hex(email + DigestUtils.md5Hex(password)).toLowerCase();
    }
}
