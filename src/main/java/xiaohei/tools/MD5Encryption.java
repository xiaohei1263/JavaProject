package xiaohei.tools;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Encryption {
    public MD5Encryption() {}
    public String getEncryption(String originString) {
        StringBuilder result = null;
        if (originString != null) {
            try {
                // ָ�����ܵķ�ʽΪMD5
                MessageDigest md = MessageDigest.getInstance("MD5");
                // ���м�������
                byte[] bytes = md.digest(originString.getBytes());
                for (byte aByte : bytes) {
                    // ������ת����ʮ��������ʽ���ַ��� ������0xff�����������ԭ���Ǳ�֤ת�����Ϊ32λ
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