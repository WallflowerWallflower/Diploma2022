import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DoctorsPageRoutingModule } from './doctors-page-routing.module';
import { ListOfDoctorComponent } from './list-of-doctor/list-of-doctor.component';


@NgModule({
  declarations: [
    ListOfDoctorComponent,
  ],
  imports: [
    CommonModule,
    DoctorsPageRoutingModule
  ]
})
export class DoctorsPageModule { }
