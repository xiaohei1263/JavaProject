package xiaohei.model;

public class UserModel {
    private String Username;
    private String Password;
    private String Id;
    private String Permissions;

    public String GetUsername() {
        return Username;
    }

    public String GetPassword() {
        return Password;
    }

    public String GetId() {
        return Id;
    }

    public String GetPermissions() {
        return Permissions;
    }

    public void SetUsername(String Username) {
        this.Username = Username;
    }

    public void SetPassword(String Password) {
        this.Password = Password;
    }

    public void SetId(String string) {
        this.Id = string;
    }

    public void SetPermissions(String permissions) {
        this.Permissions = permissions;
    }
}
