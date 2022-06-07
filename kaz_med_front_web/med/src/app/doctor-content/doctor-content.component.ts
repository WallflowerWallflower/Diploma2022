import {Component, ElementRef, EventEmitter, OnInit, Output, Renderer2} from '@angular/core';
import {DataService} from "../data.service";
import {AngularFireAuth} from "@angular/fire/compat/auth";
import {HttpService} from "../http.service";

@Component({
  selector: 'app-doctor-content',
  templateUrl: './doctor-content.component.html',
  styleUrls: ['./doctor-content.component.scss']
})
export class DoctorContentComponent implements OnInit {
  isDoctorSelected = false
  selectedDoctor: any = {}
  doctors:any = [];
  currentUser:any;
  review:string;
  selectedDoctorReviews:any=[]
  isModal:boolean = false

  constructor(private dataService: DataService, private renderer: Renderer2, private el: ElementRef,    public auth: AngularFireAuth, public hs: HttpService) { }

  ngOnInit(): void {
    this.getCurrentUser()
    this.hs.getAllDoctors().subscribe(res=>{
     this.doctors = res
      console.log(this.doctors);
    })

  }
  chooseDoctor(doctor:any){
    console.log('SELECTED',doctor)
    this.isDoctorSelected = true
    this.selectedDoctor = doctor;
    this.getDoctorReviews()
  }
  sendSelectedDoctor():void{
    this.dataService.sendDoctor(this.selectedDoctor);
  }
  selectFilter(event:any){
    if (event.target.value === 'price-decrease'){
      this.doctors = this.doctors.sort((a:any, b:any)=>{
        return a.fees < b.fees ? -1 : 1;
      })
      return this.doctors
    }
    else if(event.target.value === 'price-increase'){
      this.doctors = this.doctors.sort((a:any, b:any)=>{
        return a.fees < b.fees ? 1 : -1;
      })
      return this.doctors
    } else{
      this.doctors = this.doctors.sort((a:any, b:any)=>{
        return a.rating < b.rating ? 1 : -1;
      })
    }
  }
  setFeedback(selectedDoctor:any){
    let body ={
      reviewText: this.review
    }
    this.isModal = !this.isModal
    this.hs.setFeedback(selectedDoctor.doctorId,this.currentUser.customerId,body).subscribe(res=>{
      console.log(res);
    })
  }
  getCurrentUser() {
    // @ts-ignore
    let email: any = JSON.parse(localStorage.getItem('email'))
    if(email){
      this.hs.getAllUsers().subscribe((users) => {
        users.forEach((user: any) => {
          if (user.email === email) {
            this.currentUser = user;
          }
        })
      })
    }

  }
  closeModal(){
    this.isModal=!this.isModal
  }
  getDoctorReviews(){
    this.hs.getDoctorReview(this.selectedDoctor.doctorId).subscribe(res=>{
      console.log(res);
    })
  }
}
