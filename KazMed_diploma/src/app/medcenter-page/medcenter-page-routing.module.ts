import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {ListOfMedcenterComponent} from "./list-of-medcenter/list-of-medcenter.component";

const routes: Routes = [
  {path: '', component: ListOfMedcenterComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MedcenterPageRoutingModule { }
