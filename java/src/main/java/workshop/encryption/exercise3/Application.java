package workshop.encryption.exercise3;

import workshop.encryption.exercise4.SharingUser;

public class Application {

    public static SecureSession SESSION;

    public void login(String username, String password) throws Exception {
        SharingUser user = Users.get(username);
        String contentKey = user.getContentKey(password);
        
        SESSION = new SecureSession(user, contentKey);
    }
}