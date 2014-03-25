package workshop.encryption;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;
import helpers.RandomNonce;

import org.abstractj.kalium.keys.KeyPair;
import org.abstractj.kalium.keys.PrivateKey;
import org.abstractj.kalium.keys.PublicKey;
import org.junit.Test;

import workshop.encryption.exercise2.Asymmetric;

/**
 * Exercise 2: asymmetric encryption
 * 
 */
public class Exercise2Test {

    @Test
    public void decryptsMessage() {
        RandomNonce nonce = new RandomNonce();
        byte[] message = "a certain message".getBytes();

        byte[] encryptedMessage = Asymmetric.encrypt(Receiver.PUBLIC_KEY, Sender.PRIVATE_KEY, nonce, message);
        byte[] decryptedMessage = Asymmetric.decrypt(Receiver.PRIVATE_KEY, Sender.PUBLIC_KEY, nonce, encryptedMessage);

        assertThat(decryptedMessage, is(equalTo(message)));
    }

    public static class Sender {
        private static final KeyPair KEYPAIR = new KeyPair();
        public static final PublicKey PUBLIC_KEY = KEYPAIR.getPublicKey();
        public static final PrivateKey PRIVATE_KEY = KEYPAIR.getPrivateKey();
    }

    public static class Receiver {
        private static final KeyPair KEYPAIR = new KeyPair();
        public static final PublicKey PUBLIC_KEY = KEYPAIR.getPublicKey();
        public static final PrivateKey PRIVATE_KEY = KEYPAIR.getPrivateKey();
    }
}