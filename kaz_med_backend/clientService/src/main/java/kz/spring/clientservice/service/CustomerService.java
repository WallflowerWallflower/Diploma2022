package kz.spring.clientservice.service;

import kz.spring.clientservice.model.Customer;
import kz.spring.clientservice.model.Doctor;
import kz.spring.clientservice.repository.CustomerRepository;
import kz.spring.clientservice.repository.DoctorRepository;
import kz.spring.clientservice.service.impl.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.print.Doc;
import java.util.List;

@Service
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    private RestTemplate restTemplate;

    @Override
    public List<Customer> searchCustomerByCustomerName(String customerName) {
        return customerRepository.getCustomerByCustomerNameIsLike("%" + customerName + "%");
    }

    @Override
    public Customer findCustomerUsername(String username){
        Customer customer = customerRepository.findCustomerByEmail(username);
        if(customer == null){
            System.out.println("USER NOT FOUND!");
        }
        return customer;
    }

    @Override
    public Customer removeDoctor(Long customerId, Long doctorId) {
        Customer customer = customerRepository.getByCustomerId(customerId);

        boolean check = false;

        for(int i = 0; i < customer.getDoctors().size(); i++){
            if(customer.getDoctors().get(i).getDoctorId().equals(doctorId)){
                customer.getDoctors().remove(i);
                check = true;
                break;
            }
        }

        if(check){
            return customerRepository.saveAndFlush(customer);
        }
        return null;
    }

    @Override
    public Customer addDoctor(Long customerId, Long doctorId) {

        Customer customer = customerRepository.getByCustomerId(customerId);

        Doctor doctor = doctorRepository.getDoctorByDoctorId(doctorId);

//        Doctor doctor = restTemplate.getForObject("http://localhost:8082/doctor/" + doctorId, Doctor.class);

        boolean check = false;

        if(doctor != null && customer != null && checkDoctor(customer, doctorId)){
            customer.getDoctors().add(doctor);
            if(!check){
                return customerRepository.saveAndFlush(customer);
            }
        }
        return null;
    }

    @Override
    public boolean checkDoctor(Customer customer, Long doctorId){
        for(int i = 0; i < customer.getDoctors().size(); i++){
            if(customer.getDoctors().get(i).getDoctorId() == doctorId){
                System.out.println("You have doctor with this id " + doctorId);
                return false;
            }
        }
        return true;
    }

    @Override
    public Customer updateDoctor(Long customerId, Long doctorId) {

        Customer customer = customerRepository.getByCustomerId(doctorId);

        if (customer != null && customer.getCustomerId() != null && customer.getCustomerId() != 0L && checkDoctor(customer, doctorId)) {
            for (int i = 0; i < customer.getDoctors().size(); i++) {
                customer.getDoctors().get(i).setDoctorId(doctorId);
                return customerRepository.saveAndFlush(customer);
            }
        }
        return null;
    }

    @Override
    public Customer getById(Long id) {
        Customer customer = customerRepository.getCustomerByCustomerId(id);
        return customer;
    }

    @Override
    public Customer getByCustomerName(String customerName) {
        return customerRepository.getByCustomerName(customerName);
    }

    @Override
    public Customer getByCustomerEmail(String email){
        return customerRepository.getCustomerByEmail(email);
    }

    @Override
    public void create(Customer customer){
        customerRepository.saveAndFlush(customer);
    }

    @Override
    public void update(Customer customer, String email) {

        Customer updateCustomer = customerRepository.findCustomerByEmail(email);

        if(updateCustomer != null){

            updateCustomer.setCustomerName(customer.getCustomerName());
            updateCustomer.setCustomerSurname(customer.getCustomerSurname());
            updateCustomer.setAddress(customer.getAddress());
            updateCustomer.setCustomerTelNumber(customer.getCustomerTelNumber());
            if(customer.getEmail() != null){
                updateCustomer.setEmail(customer.getEmail());
            }
            updateCustomer.setUsername(customer.getUsername());

            customerRepository.saveAndFlush(updateCustomer);
        }else{
            System.out.println("Customer is empty!");
        }
    }

    @Override
    public List<Customer> getAllCustomer() {
        return customerRepository.findAll();
    }

    @Override
    public void DeleteById(Long id) {
        customerRepository.deleteById(id);
    }

    @Override
    public void rating(Long customerId, double rating){
        Customer customer = customerRepository.getByCustomerId(customerId);

        if(customer.getPeopleCount() < 75 && rating < 4){
            rating += 1;
        }

        customer.setRating((customer.getRating() * customer.getPeopleCount() + rating)/(customer.getPeopleCount() + 1));
        customer.setPeopleCount(customer.getPeopleCount() + 1);

        customerRepository.saveAndFlush(customer);
    }
}
