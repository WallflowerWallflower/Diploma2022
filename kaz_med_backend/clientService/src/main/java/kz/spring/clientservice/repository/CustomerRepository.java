package kz.spring.clientservice.repository;

import kz.spring.clientservice.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    List<Customer> findByCustomerId(Long id);
    List<Customer> findDoctorByCustomerName(String customerName);
    List<Customer> getCustomerByCustomerNameIsLike(String customerName);
    Customer findCustomerByUsername(String username);
    Customer getByCustomerId(Long id);
    Customer getCustomerByEmail(String email);
    Customer getCustomerByCustomerId(Long id);
    Customer getByCustomerName(String customerName);

    Customer findCustomerByEmail(String email);
}
