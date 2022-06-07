package kz.spring.reviewservice.service.impl;

import kz.spring.reviewservice.model.ReviewDoctor;

import java.util.List;

public interface IReviewDoctorService {
    List<ReviewDoctor> getAllDoctorReview(Long doctorId);

    void addReviewDoctor(ReviewDoctor reviewDoctor, Long doctor_id, String email);

    void updateReviewDoctor(ReviewDoctor reviewDoctor);

    void removeReviewDoctorById(Long reviewId);
}
