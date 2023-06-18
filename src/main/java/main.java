import xiaohei.tools.MD5Encryption;

public class main {
    public static void main(String[] args){
        String password = "1";
        MD5Encryption md = new MD5Encryption();
        String password1 = md.getEncryption(password);

        System.out.println(password1);
    }
}
