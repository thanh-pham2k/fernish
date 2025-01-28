package fernish.repository;

import fernish.domain.Product;
import fernish.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Spring Data JPA repository for the {@link User} entity.
 */
@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {}
