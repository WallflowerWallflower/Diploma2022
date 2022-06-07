import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {MainComponent} from "./main/main.component";
import {AuthComponent} from "./auth/auth.component";
import {RegistrationComponent} from "./registration/registration.component";
import {BookingComponent} from "./booking/booking.component";
import {ClinicsComponent} from "./clinics/clinics.component";
import { AboutGuard }   from '../about.guard';
import {DoctorProfileComponent} from "./doctor-profile/doctor-profile.component";
import {OverviewComponent} from "./overview/overview.component";
import {CalendarComponent} from "./calendar/calendar.component";
import {PasswordComponent} from "./password/password.component";
import {ServicesComponent} from "./services/services.component";
import {HeadComponent} from "./head/head.component";
import {DoctorContentComponent} from "./doctor-content/doctor-content.component";
import {AdminPageComponent} from "./admin-page/admin-page.component";
import {MyClinicComponent} from "./my-clinic/my-clinic.component";
import {PatientsComponent} from "./patients/patients.component";
import {UserComponent} from "./user/user.component";



const routes: Routes = [
  {path: '', component: HeadComponent, children:[
      {path: 'about', component:MainComponent},
      {path: 'services', component:ServicesComponent, canActivate: [AboutGuard]},
      {path: 'doctors', component:DoctorContentComponent,canActivate: [AboutGuard]},
      {path:'user', component: UserComponent},
      {path:'clinics', component: ClinicsComponent,canActivate: [AboutGuard]},
      {path:'booking', component: BookingComponent},
    ]},
  {path: 'admin', component: AdminPageComponent, children:[
      {path:'', component: MyClinicComponent},
      {path: 'addClinic', component: MyClinicComponent},
    ]},
  {path:'doctorPage', component: DoctorProfileComponent, children:[
      {path:'', component: OverviewComponent},
      {path:'overview', component: OverviewComponent},
      {path:'calendar', component: CalendarComponent},
      {path:'patients', component: PatientsComponent},
    ]},
  {path: 'login_page', component: AuthComponent},
  {path: 'reg_page', component: RegistrationComponent},


  {path:'password', component: PasswordComponent},


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
