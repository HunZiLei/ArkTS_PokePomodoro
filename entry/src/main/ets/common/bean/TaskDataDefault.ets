import { TaskDataInter } from './ConstantsInterface'
import Logger from '../utils/Logger'

export default class TaskData implements TaskDataInter {
  id: number = -1
  start_date_stamp: number = 0
  due_date_stamp: number = 0
  detail: string = ''
  subject: number = 0
  task_name: string = ''
  is_completed: boolean = false
  ddl_detail: string = '0.3-0.5-0.8'
  ddl_state = {
    critical: 0.3,
    hard: 0.5,
    medium: 0.8
  }

  setDDLState(debug_?: string) {
    let ddl_arr = this.ddl_detail.split('-')
    Logger.debug(`TaskDDL Info: arr = ${JSON.stringify(ddl_arr)}, det = ${this.ddl_detail}`)
    this.ddl_state.critical = Number(ddl_arr[0])
    this.ddl_state.hard = Number(ddl_arr[1])
    this.ddl_state.medium = Number(ddl_arr[2])
  }
  getDDLState(): string {
    let taskFullTime = this.due_date_stamp - this.start_date_stamp
    let nowTime = new Date()
    let remainingTime = this.due_date_stamp - nowTime.getTime()
    let resultPercentage = remainingTime / taskFullTime
    Logger.debug(`TaskDDL State: full = ${taskFullTime}, remaining = ${remainingTime}, per = ${resultPercentage}`)
    Logger.debug(`TaskDDL ------ due: ${new Date(this.due_date_stamp).toString()}, now: ${new Date().toString()}, start: ${new Date(this.start_date_stamp).toString()}`)
    Logger.debug(`TaskDDL ------: arr = ${JSON.stringify(this.ddl_state)}`)


    if (remainingTime < 0) return 'critical'
    if (resultPercentage < this.ddl_state.critical) return 'critical'
    else if (resultPercentage < this.ddl_state.hard) return 'hard'
    else if (resultPercentage < this.ddl_state.medium) return 'medium'
    else return 'easy'
  }
  getDDLPer(): number {
    let taskFullTime = this.due_date_stamp - this.start_date_stamp
    let nowTime = new Date()
    let remainingTime = this.due_date_stamp - nowTime.getTime()
    let resultPercentage = remainingTime / taskFullTime
    return resultPercentage * 100
  }
}