package www.retail.gahan.beans;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table
public class GahanProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer gp_id;
	
	@Column(name="gahan_making_date",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String gahan_making_date;
	
	@Column(name="gahanProduct_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String gahanProduct_name;
	
	@Column
	private Double gahanProduct_weight;
	
	@Column
	private Double gahanProduct_net_weight;
	
	@Column(name="gp_image_name",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String gp_image_name;
	
	@Transient
	private MultipartFile gp_imageFile;
	
	
	@Column(name="gp_status",columnDefinition="VARCHAR(255) CHARACTER SET utf8 COLLATE 	utf8_general_ci")
	private String gp_status;
	

	public Integer getGp_id() {
		return gp_id;
	}

	public void setGp_id(Integer gp_id) {
		this.gp_id = gp_id;
	}

	public String getGahan_making_date() {
		return gahan_making_date;
	}

	public void setGahan_making_date(String gahan_making_date) {
		this.gahan_making_date = gahan_making_date;
	}

	public String getGahanProduct_name() {
		return gahanProduct_name;
	}

	public void setGahanProduct_name(String gahanProduct_name) {
		this.gahanProduct_name = gahanProduct_name;
	}

	public Double getGahanProduct_weight() {
		return gahanProduct_weight;
	}

	public void setGahanProduct_weight(Double gahanProduct_weight) {
		this.gahanProduct_weight = gahanProduct_weight;
	}

	public Double getGahanProduct_net_weight() {
		return gahanProduct_net_weight;
	}

	public void setGahanProduct_net_weight(Double gahanProduct_net_weight) {
		this.gahanProduct_net_weight = gahanProduct_net_weight;
	}

	public String getGp_image_name() {
		return gp_image_name;
	}

	public void setGp_image_name(String gp_image_name) {
		this.gp_image_name = gp_image_name;
	}

	public MultipartFile getGp_imageFile() {
		return gp_imageFile;
	}

	public void setGp_imageFile(MultipartFile gp_imageFile) {
		this.gp_imageFile = gp_imageFile;
	}

	
	public String getGp_status() {
		return gp_status;
	}

	public void setGp_status(String gp_status) {
		this.gp_status = gp_status;
	}

	@Override
	public String toString() {
		return "GahanProduct [gp_id=" + gp_id + ", gahan_making_date=" + gahan_making_date + ", gahanProduct_name="
				+ gahanProduct_name + ", gahanProduct_weight=" + gahanProduct_weight + ", gahanProduct_net_weight="
				+ gahanProduct_net_weight + ", gp_image_name=" + gp_image_name + ", gp_imageFile=" + gp_imageFile
				+ ", gp_status=" + gp_status + "]";
	}

	
}
