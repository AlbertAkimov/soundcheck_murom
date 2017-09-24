package net.space.validators.json;

/**
 * @Author A.Albert
 * @Data 8/22/17
 * @Time 1:31 PM
 * @Version 1.0
 * @Info empty
 */

public class JsonResponse {

    private String status;

    private Object result;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}
