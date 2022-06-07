import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule,HttpClient } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeadComponent } from './head/head.component';
import { MainComponent } from './main/main.component';
import { FooterComponent } from './footer/footer.component';
import { AuthComponent } from './auth/auth.component';
import { RegistrationComponent } from './registration/registration.component';
import { DoctorContentComponent } from './doctor-content/doctor-content.component';
import { BookingComponent } from './booking/booking.component';
import { ClinicsComponent } from './clinics/clinics.component';
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import { AngularFireModule } from '@angular/fire/compat';
import {environment} from "../environments/environment";
import {AngularFirestoreModule} from "@angular/fire/compat/firestore";
import {AngularFireDatabaseModule} from "@angular/fire/compat/database";
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatDatepickerModule} from '@angular/material/datepicker';
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {MatNativeDateModule} from "@angular/material/core";
import {MatCardModule} from '@angular/material/card';
import {AboutGuard} from "../about.guard";
import { DoctorProfileComponent } from './doctor-profile/doctor-profile.component';
import { OverviewComponent } from './overview/overview.component';
import {DatePipe} from "@angular/common";
import { FullCalendarModule } from '@fullcalendar/angular';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import timeGridPlugin from '@fullcalendar/timegrid';
import { CalendarComponent } from './calendar/calendar.component';
import { PasswordComponent } from './password/password.component';
import { ServicesComponent } from './services/services.component';
import {TranslateModule,TranslateLoader} from '@ngx-translate/core';
import {TranslateHttpLoader} from '@ngx-translate/http-loader';
import { AdminPageComponent } from './admin-page/admin-page.component';
import { MyClinicComponent } from './my-clinic/my-clinic.component';
import { ModalComponent } from './modal/modal.component';
import { PatientsComponent } from './patients/patients.component';
import { UserComponent } from './user/user.component';


export function translateHttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http);
}
FullCalendarModule.registerPlugins([ // register FullCalendar plugins
  dayGridPlugin,
  interactionPlugin,
  timeGridPlugin
]);
@NgModule({
  declarations: [
    AppComponent,
    HeadComponent,
    MainComponent,
    FooterComponent,
    AuthComponent,
    RegistrationComponent,
    DoctorContentComponent,
    BookingComponent,
    ClinicsComponent,
    DoctorProfileComponent,
    OverviewComponent,
    CalendarComponent,
    PasswordComponent,
    ServicesComponent,
    AdminPageComponent,
    MyClinicComponent,
    ModalComponent,
    PatientsComponent,
    UserComponent
  ],
  imports: [
    FullCalendarModule,
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    HttpClientModule,
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFirestoreModule,
    AngularFireDatabaseModule,
    BrowserAnimationsModule,
    MatDatepickerModule,
    MatFormFieldModule,
    MatInputModule,
    MatNativeDateModule,
    FormsModule,
    MatCardModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: translateHttpLoaderFactory,
        deps: [HttpClient]
      }
    })
  ],
  exports:[TranslateModule],
  providers: [AboutGuard,DatePipe],
  bootstrap: [AppComponent]
})
export class AppModule { }
