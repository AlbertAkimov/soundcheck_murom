package net.space.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * @Author A.Albert
 * @Data 8/3/17
 * @Time 9:53 AM
 * @Version 1.0
 * @Info Simple javaBean object.
 */

@Entity
@Table(name = "band")
public class Band {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "CREATE_DATE")
    @Temporal(TemporalType.DATE)
    private Date createDate;

    @Column(name = "DATE_BAND")
    @Temporal(TemporalType.DATE)
    //@DateTimeFormat(iso = DateTimeFormat.ISO.DATE, pattern = "yyyy-MM-dd")
    private Date dateBand;

    @Column(name = "DAY")
    private int day;

    @Column(name = "MONTH")
    private String month;

    @Column(name = "YEAR")
    private int year;

    @Column(name = "NAME_BAND")
    private String nameBand;

    @Column(name = "START_TIME")
    private String startTime;

    @Column(name = "END_TIME")
    private String endTime;

    @Column(name = "COUNT_HOURS")
    private int countHours;

    @Column(name = "COMMENT")
    private String comment;

    @Column(name = "USER_ID")
    private long userID;

    @Column(name = "PRICE")
    private int price;

    public Band() {}


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getDateBand() {
        return dateBand;
    }

    public void setDateBand(Date dateBand) {
        this.dateBand = dateBand;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getNameBand() {
        return nameBand;
    }

    public void setNameBand(String nameBand) {
        this.nameBand = nameBand;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getCountHours() {
        return countHours;
    }

    public void setCountHours(int countHours) {
        this.countHours = countHours;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Band{" +
                "id=" + id +
                ", createDate=" + createDate +
                ", dateBand=" + dateBand +
                ", day=" + day +
                ", month='" + month + '\'' +
                ", year=" + year +
                ", nameBand='" + nameBand + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", countHours=" + countHours +
                ", comment='" + comment + '\'' +
                ", userID=" + userID +
                ", price=" + price +
                '}';
    }
}
