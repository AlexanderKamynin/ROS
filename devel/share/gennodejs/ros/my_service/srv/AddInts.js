// Auto-generated. Do not edit!

// (in-package my_service.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class AddIntsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.first = null;
      this.second = null;
    }
    else {
      if (initObj.hasOwnProperty('first')) {
        this.first = initObj.first
      }
      else {
        this.first = '';
      }
      if (initObj.hasOwnProperty('second')) {
        this.second = initObj.second
      }
      else {
        this.second = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddIntsRequest
    // Serialize message field [first]
    bufferOffset = _serializer.string(obj.first, buffer, bufferOffset);
    // Serialize message field [second]
    bufferOffset = _serializer.string(obj.second, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddIntsRequest
    let len;
    let data = new AddIntsRequest(null);
    // Deserialize message field [first]
    data.first = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [second]
    data.second = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.first);
    length += _getByteLength(object.second);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'my_service/AddIntsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c0d0db6e21f3fc1eb068f9cc22ba8beb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string first
    string second
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddIntsRequest(null);
    if (msg.first !== undefined) {
      resolved.first = msg.first;
    }
    else {
      resolved.first = ''
    }

    if (msg.second !== undefined) {
      resolved.second = msg.second;
    }
    else {
      resolved.second = ''
    }

    return resolved;
    }
};

class AddIntsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sum = null;
    }
    else {
      if (initObj.hasOwnProperty('sum')) {
        this.sum = initObj.sum
      }
      else {
        this.sum = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddIntsResponse
    // Serialize message field [sum]
    bufferOffset = _serializer.string(obj.sum, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddIntsResponse
    let len;
    let data = new AddIntsResponse(null);
    // Deserialize message field [sum]
    data.sum = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.sum);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'my_service/AddIntsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3c5c2c5628b5ddd7119bd2a006302ca9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string sum
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddIntsResponse(null);
    if (msg.sum !== undefined) {
      resolved.sum = msg.sum;
    }
    else {
      resolved.sum = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: AddIntsRequest,
  Response: AddIntsResponse,
  md5sum() { return 'd8ca4ab69fad67fcd8906ca3e09c53af'; },
  datatype() { return 'my_service/AddInts'; }
};
