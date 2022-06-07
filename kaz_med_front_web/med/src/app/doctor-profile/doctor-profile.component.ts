import {Component, Input, OnInit, Output} from '@angular/core';
import {Router} from "@angular/router";
import {HttpService} from "../http.service";


@Component({
  selector: 'app-doctor-profile',
  templateUrl: './doctor-profile.component.html',
  styleUrls: ['./doctor-profile.component.scss']
})
export class DoctorProfileComponent implements OnInit {
  @Input()
  isEdit:boolean
  public currentDoctor:any;
  public uid: any
  public isModal:boolean = false;
  public doctors: any;
  public isEditable: boolean = false;
  public patients:any =  [];
  constructor(public hs: HttpService, private route: Router) {
  }

  ngOnInit(): void {
    this.getCurrentDoctor()
  }
  logOut(){
      localStorage.clear();
      this.route.navigate(['login_page'])
  }
  toggleEditable(){
    console.log(this.isEditable);
    this.isEditable = !this.isEditable
  }
  getValue(body:any){
    this.hs.updateDoctor(body).subscribe(()=>{
      this.isEditable = !this.isEditable
      this.isModal = !this.isModal;
      this.getCurrentDoctor()
    })
  }
  getCurrentDoctor(){
    let email = localStorage.getItem('email')
    if(email){
      this.hs.getDoctorByEmail(JSON.parse(email)).subscribe(res=>{
        this.currentDoctor = res;
      })
    }
  }
  closeModal(){
    this.isModal=!this.isModal
  }
}
