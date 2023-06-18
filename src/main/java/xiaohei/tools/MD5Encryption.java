package xiaohei.tools;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Encryption {
    public MD5Encryption() {}
    public String getEncryption(String originString) {
        StringBuilder result = null;
        if (originString != null) {
            try {
                // 指定加密的方式为MD5
                MessageDigest md = MessageDigest.getInstance("MD5");
                // 进行加密运算
                byte[] bytes = md.digest(originString.getBytes());
                for (byte aByte : bytes) {
                    // 将整数转换成十六进制形式的字符串 这里与0xff进行与运算的原因是保证转换结果为32位
                    String str = Integer.toHexString(aByte & 0xFF);
                    if (str.length() == 1) {
                        str += "F";
                    }
                    result = (result == null ? new StringBuilder("null") : result).append(str);
                }
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
        }
        return result != null ? result.toString().toUpperCase() : null;
    }
}