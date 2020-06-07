package GP.domain;

public class PartisanInfo {
    private String partisan;
    private String number;
    private String establish_time;
    private String introduction;
    private String chairman;

    public String getChairman() {
        return chairman;
    }

    public void setChairman(String chairman) {
        this.chairman = chairman;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
    public String getPartisan() {
        return partisan;
    }

    public void setPartisan(String partisan) {
        this.partisan = partisan;
    }

    public String getEstablish_time() {
        return establish_time;
    }

    public void setEstablish_time(String establish_time) {
        this.establish_time = establish_time;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }
}
