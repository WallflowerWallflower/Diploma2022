import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { ServicePageComponent } from './service-component/service-page.component';

const routes: Routes = [
  {path: '', component: ServicePageComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MedcenterPageRoutingModule { }
