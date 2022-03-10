import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {ListOfDoctorComponent} from "./list-of-doctor/list-of-doctor.component";

const routes: Routes = [
  {path: '', component: ListOfDoctorComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DoctorsPageRoutingModule { }
