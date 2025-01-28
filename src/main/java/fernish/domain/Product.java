package fernish.domain;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "product")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(nullable = false, length = 255)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(name = "price_to_buy", nullable = false, precision = 10, scale = 2)
    private BigDecimal priceToBuy;

    @Column(name = "price_per_month", nullable = false, precision = 10, scale = 2)
    private BigDecimal pricePerMonth;

    @Column(nullable = false, length = 50)
    @Enumerated(EnumType.STRING)
    private Availability availability;

    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    @Column(length = 50)
    private String color;

    @Column(length = 255)
    private String material;

    @Column(length = 50)
    private String size;

    @ElementCollection
    @CollectionTable(name = "product_images", joinColumns = @JoinColumn(name = "id"))
    @Column(name = "image_url")
    private List<String> images;

    public enum Availability {
        IN_STOCK("INSTOCK"),
        LIMITED_QUANTITY("LIMITED"),
        OUT_OF_STOCK("OUTOFSTOCK");

        private final String value;

        Availability(String value) {
            this.value = value;
        }

        @Override
        public String toString() {
            return value;
        }
    }
}
