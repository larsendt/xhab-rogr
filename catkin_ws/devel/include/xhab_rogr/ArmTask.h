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
 * Auto-generated by genmsg_cpp from file /home/xhab/xhab-rogr/catkin_ws/src/xhab_rogr/msg/ArmTask.msg
 *
 */


#ifndef XHAB_ROGR_MESSAGE_ARMTASK_H
#define XHAB_ROGR_MESSAGE_ARMTASK_H


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
struct ArmTask_
{
  typedef ArmTask_<ContainerAllocator> Type;

  ArmTask_()
    : shoulder1_angle(0.0)
    , shoulder2_angle(0.0)
    , elbow1_angle(0.0)
    , elbow2_angle(0.0)
    , wrist_angle(0.0)
    , endeffector_angle(0.0)  {
    }
  ArmTask_(const ContainerAllocator& _alloc)
    : shoulder1_angle(0.0)
    , shoulder2_angle(0.0)
    , elbow1_angle(0.0)
    , elbow2_angle(0.0)
    , wrist_angle(0.0)
    , endeffector_angle(0.0)  {
    }



   typedef float _shoulder1_angle_type;
  _shoulder1_angle_type shoulder1_angle;

   typedef float _shoulder2_angle_type;
  _shoulder2_angle_type shoulder2_angle;

   typedef float _elbow1_angle_type;
  _elbow1_angle_type elbow1_angle;

   typedef float _elbow2_angle_type;
  _elbow2_angle_type elbow2_angle;

   typedef float _wrist_angle_type;
  _wrist_angle_type wrist_angle;

   typedef float _endeffector_angle_type;
  _endeffector_angle_type endeffector_angle;




  typedef boost::shared_ptr< ::xhab_rogr::ArmTask_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::xhab_rogr::ArmTask_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct ArmTask_

typedef ::xhab_rogr::ArmTask_<std::allocator<void> > ArmTask;

typedef boost::shared_ptr< ::xhab_rogr::ArmTask > ArmTaskPtr;
typedef boost::shared_ptr< ::xhab_rogr::ArmTask const> ArmTaskConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::xhab_rogr::ArmTask_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::xhab_rogr::ArmTask_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::xhab_rogr::ArmTask_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::xhab_rogr::ArmTask_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::xhab_rogr::ArmTask_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::xhab_rogr::ArmTask_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::xhab_rogr::ArmTask_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::xhab_rogr::ArmTask_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::xhab_rogr::ArmTask_<ContainerAllocator> >
{
  static const char* value()
  {
    return "032668acfa00b70c60776d883d042701";
  }

  static const char* value(const ::xhab_rogr::ArmTask_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x032668acfa00b70cULL;
  static const uint64_t static_value2 = 0x60776d883d042701ULL;
};

template<class ContainerAllocator>
struct DataType< ::xhab_rogr::ArmTask_<ContainerAllocator> >
{
  static const char* value()
  {
    return "xhab_rogr/ArmTask";
  }

  static const char* value(const ::xhab_rogr::ArmTask_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::xhab_rogr::ArmTask_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 shoulder1_angle\n\
float32 shoulder2_angle\n\
float32 elbow1_angle\n\
float32 elbow2_angle\n\
float32 wrist_angle\n\
float32 endeffector_angle\n\
";
  }

  static const char* value(const ::xhab_rogr::ArmTask_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::xhab_rogr::ArmTask_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.shoulder1_angle);
      stream.next(m.shoulder2_angle);
      stream.next(m.elbow1_angle);
      stream.next(m.elbow2_angle);
      stream.next(m.wrist_angle);
      stream.next(m.endeffector_angle);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct ArmTask_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::xhab_rogr::ArmTask_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::xhab_rogr::ArmTask_<ContainerAllocator>& v)
  {
    s << indent << "shoulder1_angle: ";
    Printer<float>::stream(s, indent + "  ", v.shoulder1_angle);
    s << indent << "shoulder2_angle: ";
    Printer<float>::stream(s, indent + "  ", v.shoulder2_angle);
    s << indent << "elbow1_angle: ";
    Printer<float>::stream(s, indent + "  ", v.elbow1_angle);
    s << indent << "elbow2_angle: ";
    Printer<float>::stream(s, indent + "  ", v.elbow2_angle);
    s << indent << "wrist_angle: ";
    Printer<float>::stream(s, indent + "  ", v.wrist_angle);
    s << indent << "endeffector_angle: ";
    Printer<float>::stream(s, indent + "  ", v.endeffector_angle);
  }
};

} // namespace message_operations
} // namespace ros

#endif // XHAB_ROGR_MESSAGE_ARMTASK_H
