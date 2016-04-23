package authentication;

public class FaceBook {

    private final String IDApp= "811147345695700";
    private final String SecretApp= "01ea2b9b767e3656bef3acc2238c912a";
    private final String URLApp= "http://localhost:8080/";
    private String code;

    public String getIDApp() {
        return IDApp;
    }

    public String getSecretApp() {
        return SecretApp;
    }

    public String getURLApp() {
        return URLApp;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
