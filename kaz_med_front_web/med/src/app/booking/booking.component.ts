import {Component, OnInit} from '@angular/core';
import {DataService} from "../data.service";
import {FormBuilder, FormControl, FormGroup} from "@angular/forms";
import {Router} from "@angular/router";

import {DatePipe} from "@angular/common";
import {TranslateService} from "@ngx-translate/core";
import {HttpService} from "../http.service";



@Component({
  selector: 'app-booking',
  templateUrl: './booking.component.html',
  styleUrls: ['./booking.component.scss']
})
export class BookingComponent implements OnInit {
  form: FormGroup;
  pickerCtl = new FormControl(new Date());
  constructor(
    public hs: HttpService,
    public translateService: TranslateService,
    private  dataService: DataService,
    private fb: FormBuilder,
    public Router: Router,
    public pipe: DatePipe,

  ) {
    translateService.addLangs(['kz','en','rus']);
    translateService.setDefaultLang('kz');
    this.form = fb.group({ pickerCtl: this.pickerCtl});
    this.pickerCtl.valueChanges.subscribe((v) => {
      this.patientDate = this.pipe.transform(v, 'YYYY/MM/dd');
    })
  }
  isChecked = false;
  workTime = []
  public isModal:boolean = false
  patientDate : any;
  patientTime = ''
  currentDoctor: any;
  ngOnInit(): void {
    this.dataService.getDoctor().subscribe((doctor)=>{
      this.currentDoctor = doctor
      console.log("BOOKING",this.currentDoctor.doctorId)
      let startTime =  this.currentDoctor.workTimeFrom.split(':');
      let endTime = this.currentDoctor.workTimeTo.split(':')
      let timeDiff = endTime[0] - startTime[0];
      for (let i = 0 ; i <= timeDiff; i++){
        let hour = parseInt(startTime[0]) + i
        // @ts-ignore
        this.workTime.push(`${hour}:00`)
      }
    })
  }
  activeToggle(event:any){
    let el = event.target;
    this. patientTime = el.innerHTML
    if (this.patientTime && this.patientDate){
      this.isChecked = true
    }

  }
  reserve(){
    this.isModal=!this.isModal
    let doctorID = this.currentDoctor.doctorId;
    let date = this.patientDate.split('/').join('-');
    let time = this.patientTime
    let body = {
      date : date,
      time:time
    }
    this.hs.createAppointment(body,doctorID).subscribe()
    this.hs.getOwnAppointments().subscribe(console.log)
    this.pickerCtl.reset()
    // alert(`Registration to Dr.${this.currentDoctor.name} was done!`)
    // this.Router.navigate(['clinics'])
  }
  closeModal(){
    this.isModal=!this.isModal
  }

}
