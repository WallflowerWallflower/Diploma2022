package kz.spring.appointmentservice.controller;

import kz.spring.appointmentservice.model.Appointment;
import kz.spring.appointmentservice.service.impl.IAppointmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/appointment")
@CrossOrigin(origins = "*")
public class AppointmentController {

    @Autowired
    private IAppointmentService iAppointmentService;

    @GetMapping("/public/all")
    public List<Appointment> getAllAppointment(){
        return iAppointmentService.getAllAppointment();
    }

    @GetMapping("/private/{id}")
    public Appointment getById(@PathVariable("id") Long id){
        return iAppointmentService.getById(id);
    }

    @GetMapping("/public/date/{date}")
    public Appointment getByDate(@PathVariable("date") Date date){
        return iAppointmentService.getByDate(date);
    }

    @DeleteMapping("/private/delete/{appointment_id}")
    public void deleteAppointmentByID(@PathVariable("id") Long id){
        iAppointmentService.DeleteById(id);
    }

    @PostMapping(value = "/public/create-appointment/{doctorId}/{username}", consumes = {"application/xml","application/json"})
    public void createAppointment(@RequestBody Appointment appointment, @PathVariable("doctorId") Long doctorId, @PathVariable("username") String username){
        iAppointmentService.create(appointment, doctorId, username);
    }

    @PutMapping(value = "/private/update-appointment/{medCenterId}/{appointmentId}/{doctorId}/{customerId}", consumes = {"application/xml","application/json"})
    public void updateAppointment(@RequestBody Appointment appointment, @PathVariable("medCenterId") Long medCenterId, @PathVariable("appointmentId") Long appointmentId, @PathVariable("doctorId") Long doctorId, @PathVariable("customerId") Long customerId){
        iAppointmentService.update(appointment, medCenterId, appointmentId, doctorId, customerId);
    }

    @PatchMapping("/private/update-customer/{appointmentId}/{customerId}")
    public ResponseEntity<?> updateCustomer(@PathVariable("appointmentId") Long appointmentId, @PathVariable("customerId") Long customerId) {
        return ResponseEntity.ok(iAppointmentService.updateCustomer(appointmentId, customerId));
    }

    @PatchMapping("/private/update-doctor/{appointmentId}/{doctorId}")
    public ResponseEntity<?> updateDoctor(@PathVariable("appointmentId") Long appointmentId, @PathVariable("doctorId") Long doctorId) {
        return ResponseEntity.ok(iAppointmentService.updateDoctor(appointmentId, doctorId));
    }

    @PatchMapping("/private/update-medCenter/{appointmentId}/{medCenterId}")
    public ResponseEntity<?> updateMedCenter(@PathVariable("appointmentId") Long appointmentId, @PathVariable("medCenterId") Long medCenterId) {
        return ResponseEntity.ok(iAppointmentService.updateMedCenter(appointmentId, medCenterId));
    }

    @PatchMapping("/private/update-appointment-status/{appointmentId}/{status}")
    public ResponseEntity<?> updateAppointmentStatus(@PathVariable("appointmentId") Long appointmentId, @PathVariable("status") String status){
        return ResponseEntity.ok(iAppointmentService.updateStatus(appointmentId, status));
    }

    @GetMapping("/private/customer/{email}")
    public List<Appointment> getAllCustomerAppointment(@PathVariable("email") String email){
        return iAppointmentService.getAllCustomerAppointment(email);
    }

    @GetMapping("/private/doctor/{email}")
    public List<Appointment> getAllDoctorAppointment(@PathVariable("email") String email){
        return iAppointmentService.getAllDoctorAppointment(email);
    }

    @GetMapping("/private/medCenter/{email}")
    public List<Appointment> getAllMedCenterAppointment(@PathVariable("email") String email){
        return iAppointmentService.getAllMedCenterAppointment(email);
    }

    @GetMapping("/public/search/status/{status}")
    public ResponseEntity<?> searchAppointmentStatus(@PathVariable("status") String status) {
        return ResponseEntity.ok(iAppointmentService.searchAppointmentStatus(status));
    }
}
