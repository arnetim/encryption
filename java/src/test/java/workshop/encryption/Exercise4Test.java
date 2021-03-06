package workshop.encryption;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Before;
import org.junit.Test;

import workshop.encryption.exercise3.Application;
import workshop.encryption.exercise3.Users;
import workshop.encryption.exercise4.SharingUser;

/**
 * Exercise 4: share a content key
 * 
 */
public class Exercise4Test {

    private Application application;

    @Before
    public void setUp() throws Exception {
        application = new Application();
        Users.add("user", "a password");
        Users.add("another user", "other password");
        
        application.login("user", "a password");
        SharingUser user = Users.get("user");
        user.setName("a developer");
        user.setGender("m");
    }

    @Test
    public void otherUserCanReadUnencryptedInformation() throws Exception {
        application.login("another user", "other password");
        SharingUser user = Users.get("user");
        
        assertThat(user.getGender(), is(equalTo("m")));
    }
    
    @Test(expected=Exception.class)
    public void otherUserCannotReadPersonalInformation() throws Exception {
        application.login("another user", "other password");
        SharingUser user = Users.get("user");
        
        System.out.println(user.getName());
    }
    
    @Test
    public void otherUserCanReadPersonalInformationAfterSharing() throws Exception {
        application.login("user", "a password");
        SharingUser user = Users.get("user");
        SharingUser otherUser = Users.get("another user");
        user.shareContentKeyWith(otherUser);
        
        application.login("another user", "other password");
        user = Users.get("user");
        
        assertThat(user.getName(), is(equalTo("a developer")));
    }
}