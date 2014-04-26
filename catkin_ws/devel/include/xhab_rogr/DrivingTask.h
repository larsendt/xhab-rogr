/* Software License Agreement (BSD License)
 *
 * Copyright (c) 2011, Willow Garage, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of Willow Garage, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * Auto-generated by genmsg_cpp from file /home/xhab/xhab-rogr/catkin_ws/src/xhab_rogr/msg/DrivingTask.msg
 *
 */


#ifndef XHAB_ROGR_MESSAGE_DRIVINGTASK_H
#define XHAB_ROGR_MESSAGE_DRIVINGTASK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace xhab_rogr
{
template <class ContainerAllocator>
struct DrivingTask_
{
  typedef DrivingTask_<ContainerAllocator> Type;

  DrivingTask_()
    : timestamp()
    , trans_x(0.0)
    , trans_y(0.0)
    , rot(0.0)  {
    }
  DrivingTask_(const ContainerAllocator& _alloc)
    : timestamp()
    , trans_x(0.0)
    , trans_y(0.0)
    , rot(0.0)  {
    }



   typedef ros::Time _timestamp_type;
  _timestamp_type timestamp;

   typedef float _trans_x_type;
  _trans_x_type trans_x;

   typedef float _trans_y_type;
  _trans_y_type trans_y;

   typedef float _rot_type;
  _rot_type rot;


    static const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  source;
     static const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  target;
 

  typedef boost::shared_ptr< ::xhab_rogr::DrivingTask_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::xhab_rogr::DrivingTask_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct DrivingTask_

typedef ::xhab_rogr::DrivingTask_<std::allocator<void> > DrivingTask;

typedef boost::shared_ptr< ::xhab_rogr::DrivingTask > DrivingTaskPtr;
typedef boost::shared_ptr< ::xhab_rogr::DrivingTask const> DrivingTaskConstPtr;

// constants requiring out of line definition

   
   template<typename ContainerAllocator> const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > 
      DrivingTask_<ContainerAllocator>::source =
        
          "rogr"
        
        ;
   

   
   template<typename ContainerAllocator> const std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > 
      DrivingTask_<ContainerAllocator>::target =
        
          "drivingmechanism"
        
        ;
   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::xhab_rogr::DrivingTask_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::xhab_rogr::DrivingTask_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace xhab_rogr

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'xhab_rogr': ['/home/xhab/xhab-rogr/catkin_ws/src/xhab_rogr/msg'], 'std_msgs': ['/opt/ros/hydro/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::xhab_rogr::DrivingTask_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::xhab_rogr::DrivingTask_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::xhab_rogr::DrivingTask_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::xhab_rogr::DrivingTask_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::xhab_rogr::DrivingTask_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::xhab_rogr::DrivingTask_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::xhab_rogr::DrivingTask_<ContainerAllocator> >
{
  static const char* value()
  {
    return "25794bc2e5cd06007a6b358f4e2131b4";
  }

  static const char* value(const ::xhab_rogr::DrivingTask_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x25794bc2e5cd0600ULL;
  static const uint64_t static_value2 = 0x7a6b358f4e2131b4ULL;
};

template<class ContainerAllocator>
struct DataType< ::xhab_rogr::DrivingTask_<ContainerAllocator> >
{
  static const char* value()
  {
    return "xhab_rogr/DrivingTask";
  }

  static const char* value(const ::xhab_rogr::DrivingTask_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::xhab_rogr::DrivingTask_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string source = rogr\n\
string target = drivingmechanism\n\
time timestamp\n\
float32 trans_x\n\
float32 trans_y\n\
float32 rot\n\
\n\
";
  }

  static const char* value(const ::xhab_rogr::DrivingTask_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::xhab_rogr::DrivingTask_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.timestamp);
      stream.next(m.trans_x);
      stream.next(m.trans_y);
      stream.next(m.rot);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct DrivingTask_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::xhab_rogr::DrivingTask_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::xhab_rogr::DrivingTask_<ContainerAllocator>& v)
  {
    s << indent << "timestamp: ";
    Printer<ros::Time>::stream(s, indent + "  ", v.timestamp);
    s << indent << "trans_x: ";
    Printer<float>::stream(s, indent + "  ", v.trans_x);
    s << indent << "trans_y: ";
    Printer<float>::stream(s, indent + "  ", v.trans_y);
    s << indent << "rot: ";
    Printer<float>::stream(s, indent + "  ", v.rot);
  }
};

} // namespace message_operations
} // namespace ros

#endif // XHAB_ROGR_MESSAGE_DRIVINGTASK_H
