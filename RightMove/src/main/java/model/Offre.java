package model;

import java.io.Serializable;

public class Offre implements Serializable {

	private static final long serialVersionUID = 1L;
	private String article;
    private float offeresPrice;
    private String addedBy; 
    public Offre(String article, float offeresPrice, String addedBy) {
        this.article = article;
        this.offeresPrice = offeresPrice;
        this.addedBy = addedBy;
    }

    public Offre() {
        super();
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public float getOfferesPrice() {
        return offeresPrice;
    }

    public void setOfferesPrice(float offeresPrice) {
        this.offeresPrice = offeresPrice;
    }

    public String getAddedBy() {
        return addedBy;
    }

    public void setAddedBy(String addedBy) {
        this.addedBy = addedBy;
    }

    @Override
    public String toString() {
        return "Offre [article=" + article + ", offeresPrice=" + offeresPrice + ", addedBy=" + addedBy + "]";
    }
}
