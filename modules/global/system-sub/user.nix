{ config, pkgs, ... }:


{
 users.users."starry" = {
   isNormalUser = true;
   description = "StarryMohannad";
   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.

   # TODO: replace the password with your password ;)
   hashedPassword="$6$U9CycjFVXgPJZ.pr$ciJPJ6SMSSxGyQyLMUJwa6RaWLypHR3kvKW9.xvncU33.N1QnLEWgOfVhjxpjpBMGx1C.aG6Lzr.bhUxsEEko.";
 };
}
