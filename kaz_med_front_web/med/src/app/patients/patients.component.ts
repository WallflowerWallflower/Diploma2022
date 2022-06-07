import { Component, OnInit } from '@angular/core';
import {HttpService} from "../http.service";
import {DatePipe} from "@angular/common";

@Component({
  selector: 'app-patients',
  templateUrl: './patients.component.html',
  styleUrls: ['./patients.component.scss']
})
export class PatientsComponent implements OnInit {
  public appointments: any
  public date: any
  public patients: any[] = []
  public pipe: DatePipe
  constructor(public hs: HttpService) { }

  ngOnInit(): void {
    this.hs.getDoctorAppointments().subscribe(res=>{
      this.appointments = res;
      this.appointments.forEach((res:any)=>{
        if(res){
          this.date = res.date.split('T')[0]
        }
      })
    })
    console.log(this.patients);
  }

}
