package kz.spring.medservice.repository;

import kz.spring.medservice.model.MedCenter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MedCenterRepository extends JpaRepository<MedCenter, Long> {
    List<MedCenter> findByMedCenterId(Long id);
    List<MedCenter> findMedCenterByMedCenterName(String medCenterName);
    List<MedCenter> getMedCenterByMedCenterNameIsLike(String medCenterName);
    List<MedCenter> getMedCenterByMedCenterAddressIsLike(String medCenterAddress);
//    List<MedCenter> findAllByDoctors(String medCenterDoctor);
    MedCenter getByMedCenterId(Long id);
    MedCenter getById(Long id);
    MedCenter getMedCenterByMedCenterName(String medCenterName);
    MedCenter findMedCenterByMedCenterEmail(String email);
    MedCenter getMedCenterByMedCenterAddress(String address);
}
