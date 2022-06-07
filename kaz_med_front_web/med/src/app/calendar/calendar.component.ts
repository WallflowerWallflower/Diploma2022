import { Component, OnInit } from '@angular/core';
import {CalendarOptions} from "@fullcalendar/angular";
import {DataService} from "../data.service";
import {HttpService} from "../http.service";
import {DatePipe} from "@angular/common";
@Component({
  selector: 'app-calendar',
  templateUrl: './calendar.component.html',
  styleUrls: ['./calendar.component.scss']
})
export class CalendarComponent implements OnInit {
  patients:[];
  events: any =[
  ]
  calendarOptions: CalendarOptions = {
  };
  constructor(public ds:DataService,public hs: HttpService,public pipe: DatePipe) { }

  ngOnInit(): void {
    // console.log(this.events);
    this.hs.getDoctorAppointments().subscribe(res=>{
      this.patients = res;
      this.patients.forEach((patient:any)=>{
        console.log(patient.date)
        let event = {
          title: `Patient - ${patient.customer.customerName} ${patient.customer.customerSurname} `,
          start:`${this.pipe.transform(patient.date,'YYYY-MM-dd')}T${patient.time}`,
          color: '#6d28d9',
          textColor: '#ffffff',
          displayEventTime: true
        }
        console.log(event.start);
        this.events.push(event)
          this.calendarOptions = {
            headerToolbar: {
              left: 'prev,next',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek'
            },
          events: this.events,
            weekends: true
          }
      })
    })
  }


}
