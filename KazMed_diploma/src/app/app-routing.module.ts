import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {HomeComponent} from "./main-page/home/home.component";
import {AuthGuService} from "./auth-gu.service";
import { ServicePageComponent } from './service-page/service-component/service-page.component';

const routes: Routes = [
  {path: 'home', component: HomeComponent },
  {path: 'doctors', loadChildren: () => import('./doctors-page/doctors-page.module').then(d => d.DoctorsPageModule), canActivate: [AuthGuService]},
  {path: 'medcenter', loadChildren: () => import('./medcenter-page/medcenter-page.module').then(m => m.MedcenterPageModule), canActivate: [AuthGuService]},
  // {path: 'user', loadChildren: () => import('./user-page/user-page.module').then(u => u.UserPageModule), canActivate: [AuthGuService]},
  // {path: 'service', loadChildren: () => import('./service-page/service-page.module').then(s => s.ServicePageModule), canActivate: [AuthGuService]},
  {path: 'service', component: ServicePageComponent, canActivate: [AuthGuService]},
  {path: 'about', loadChildren: () => import('./about-us-page/about-us-page.module').then(a => a.AboutUsPageModule)},
  {path: '', redirectTo: '/home', pathMatch: 'full'}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
