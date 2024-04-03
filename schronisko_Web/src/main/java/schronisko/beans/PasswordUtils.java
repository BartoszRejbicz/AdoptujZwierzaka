package schronisko.beans;

import org.mindrot.jbcrypt.BCrypt;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class PasswordUtils {

	public static String hashPassword(String plainTextPassword) {
		// Generuj sol (salt) z entropią 12
		String salt = BCrypt.gensalt(12);

		// Haszuj hasło przy użyciu soli
		return BCrypt.hashpw(plainTextPassword, salt);
	}

	public static boolean checkPassword(String plainTextPassword, String hashedPassword) {
		// Sprawdź, czy hasło pasuje do hasha
		return BCrypt.checkpw(plainTextPassword, hashedPassword);
	}
}
