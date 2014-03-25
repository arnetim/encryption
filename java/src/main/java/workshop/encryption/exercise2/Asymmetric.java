package workshop.encryption.exercise2;

import helpers.RandomNonce;

import org.abstractj.kalium.keys.PrivateKey;
import org.abstractj.kalium.keys.PublicKey;

public class Asymmetric {
    
    public static byte[] encrypt(PublicKey receiverPublicKey,
            PrivateKey senderPrivateKey, RandomNonce nonce, byte[] message) {

        /**
         * TODO: implement this method
         * - take a look at the implementation exercise1.Symmetric#encrypt
         * - use crypto.Box#encrypt
         *
         */

        return null;
    }
    
    public static byte[] decrypt(PrivateKey receiverPrivateKey,
            PublicKey senderPublicKey, RandomNonce nonce, byte[] encryptedMessage) {

        /**
         * TODO: implement this method
         * - take a look at the implementation exercise1.Symmetric#decrypt
         * - use crypto.Box#decrypt
         *
         */

        return null;

    }
}