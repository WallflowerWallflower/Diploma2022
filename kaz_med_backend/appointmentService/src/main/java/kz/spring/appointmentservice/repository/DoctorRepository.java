package kz.spring.appointmentservice.repository;

import kz.spring.appointmentservice.model.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DoctorRepository extends JpaRepository<Doctor, Long> {
    Doctor getDoctorByDoctorId(Long id);
}
