import "../css/app.css"
import "phoenix_html"
import {Socket} from "phoenix"
import {Fishtank} from "./fishtank"

let socket = new Socket("/socket", {params: {token: window.userToken}})
socket.connect()

let fishtank = new Fishtank;

let channel = socket.channel("fishtank", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

channel.on("update", payload => {
  fishtank.update(payload)
})

export default socket
