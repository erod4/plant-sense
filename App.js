import { StatusBar } from "expo-status-bar";
import React, { useEffect, useState } from "react";
import { View, TextInput, StyleSheet } from "react-native";
import SharedGroupPreferences from "react-native-shared-group-preferences";
import PlantMonitorScreen from "./Components/PlantMonitorScreen/PlantMonitorScreen";
const group = "group.streak";

export default function App() {
  const widgetData = [
    {
      id: 1,
      temperature: 22.5, // in degrees Celsius
      humidity: 55.3, // in percentage
      moisture: 35.2, // in percentage
    },
    {
      id: 2,
      temperature: 24.1, // in degrees Celsius
      humidity: 60.8, // in percentage
      moisture: 42.7, // in percentage
    },
    {
      id: 3,
      temperature: 20.8, // in degrees Celsius
      humidity: 48.6, // in percentage
      moisture: 29.5, // in percentage
    },
  ];
  useEffect(() => {
    handleSubmit();
  }, [widgetData]);

  const handleSubmit = async () => {
    try {
      // Check if SharedGroupPreferences and the group are correctly initialized
      if (SharedGroupPreferences && group) {
        console.log("Data to save:", widgetData); // Log the data before saving
        await SharedGroupPreferences.setItem("widgetKey", widgetData, group);
        console.log("Data successfully saved to shared preferences");
      } else {
        console.log(
          "SharedGroupPreferences or group identifier is not defined"
        );
      }
    } catch (error) {
      console.log("Error setting item in shared preferences:", error);
    }
  };
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />

      <PlantMonitorScreen />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
