# v-calendar
## Links
https://vcalendar-legacy.netlify.com/#welcome-to-v-calendar
https://codesandbox.io/s/8mwqw5ok2
## v-date-picker
### Installation
````
npm install v-calendar@0.9.7
````
### main.js
````
import VCalendar from 'v-calendar'
import 'v-calendar/lib/v-calendar.min.css'

Vue.use(VCalendar)
````
### Component
````
<!--            <b-form-group-->
<!--              type="hidden"-->
<!--              label="Date Format"-->
<!--              label-for="inputFormat"-->
<!--              :label-cols="3"-->
<!--            >-->
<!--              <b-form-input-->
<!--                class='input'-->
<!--                type="text"-->
<!--                v-model='inputFormat'-->
<!--                placeholder='L'>-->
<!--              </b-form-input>-->
<!--            </b-form-group>-->

            <b-form-group
              label="Start Date"
              label-for="start_date"
              :label-cols="3"
            >
              <v-date-picker
                v-model='start_date'
                popover-visibility='hover'
                :input-props='inputProps'
                :formats='formats' >
              </v-date-picker>
            </b-form-group>
````
````
import {setupCalendar, DatePicker} from 'v-calendar'

setupCalendar({
    firstDayOfWeek: 2
})

export default {
    name: 'UserProfilesEdit',
    components: {
        'v-date-picker': DatePicker
    },
    data() {
        return {
            start_date: new Date(),
            inputProps: {
                class: 'input',
            },
            inputFormat: "YYYY-MM-DD, YYYY/MM/DD",
        }
    },
    computed: {
        formats() {
            return {
                input: this.inputFormat && this.inputFormat.split(','),
            };
        },
    },
    watch: {
        formats() {
            this.start_date = new Date(this.start_date);
        }
    }
````

