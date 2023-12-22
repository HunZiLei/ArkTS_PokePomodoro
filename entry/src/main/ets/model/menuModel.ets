export class MenuModel {
  id: number
  name: string
  icon: Resource

  constructor(id: number, name: string, icon: Resource) {
    this.id = id;
    this.name = name;
    this.icon = icon;
  }
}

export function getMenuList(): Array<MenuModel> {
  return [
    { id: 0, name: '历史记录', icon: $r('app.media.ic_history') },
    { id: 1, name: '我的消息', icon: $r('app.media.ic_message') },
    { id: 2, name: '我的收藏', icon: $r('app.media.ic_collect') },
    { id: 3, name: '修改密码', icon: $r('app.media.ic_password') },
    { id: 4, name: '意见反馈', icon: $r('app.media.ic_feedback') },
  ]
}