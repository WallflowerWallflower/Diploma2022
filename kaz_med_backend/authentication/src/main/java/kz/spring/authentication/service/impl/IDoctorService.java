package kz.spring.authentication.service.impl;

import kz.spring.authentication.model.Doctor;

import java.util.List;

public interface IDoctorService {
    Doctor getDoctorById(Long doctorId);

    Doctor getByDoctorName(String doctorName);

    void updateDoc(Doctor customer);

    List<Doctor> getAllDoctorsBy();

    void deleteDoctor(Long doctorId);

    boolean addDoctor(Doctor doctor);

    boolean activateDoctor(String code);

    String forgetPasswordDoctor(String email);

    void updatePasswordDoctor(String email, String password);

    Doctor getDoctorByEmail(String email);

    void update(Doctor doctor, String email);

    Doctor addSpecialty(String email, Long specialtyId);

    boolean checkSpecialty(Doctor doctor, Long specialtyId);

    Doctor updateSpecialty(String email, Long specialtyId);

    Doctor removeSpecialty(String email, Long specialtyId);
}
