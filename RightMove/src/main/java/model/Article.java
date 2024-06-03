package model;

import java.io.Serializable;
import java.util.List;

public class Article implements Serializable {
    
	private static final long serialVersionUID = 1L;
	private String title;
    private float price;
    private List<Offre> offres;
    private String addedBy;
    private float offer; 
    public Article(String title, float price, List<Offre> offres, String addedBy, float offer) {
        this.title = title;
        this.price = price;
        this.offres = offres;
        this.addedBy = addedBy;
        this.offer = offer;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public List<Offre> getOffres() {
        return offres;
    }

    public void setOffres(List<Offre> offres) {
        this.offres = offres;
    }

    public String getAddedBy() {
        return addedBy;
    }

    public void setAddedBy(String addedBy) {
        this.addedBy = addedBy;
    }

    public float getOffer() {
        return offer;
    }

    public void setOffer(float offer) {
        this.offer = offer;
    }
   
    public Offre getMaxOffer() {
        if (offres.isEmpty()) {
            return null;
        }

        Offre maxOffer = offres.get(0);
        for (Offre offre : offres) {
            if (offre.getOfferesPrice() > maxOffer.getOfferesPrice()) {
                maxOffer = offre;
            }
        }
        return maxOffer;
    }
   
}

