import { View, Text, StyleSheet } from "react-native";
import React from "react";
import CircularProgress from "react-native-circular-progress-indicator";
import ProgressContainer from "./ProgressContainer";

const SinglePlantMonitor = ({ name, data }) => {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Alocasia</Text>
      <View style={styles.progressBarContainer}>
        <ProgressContainer name={"Temperature"} suffix={"°F"} value={77} />

        <ProgressContainer name={"Moisture"} suffix={"%"} value={52} />
        <ProgressContainer name={"Humidity"} suffix={"%"} value={86} />
      </View>
    </View>
  );
};
const styles = StyleSheet.create({
  container: {
    width: "90%",
    borderRadius: 10,
    padding: 5,
    backgroundColor: "#fff", // Ensure the background color is set for better shadow visibility
    // Shadow properties for iOS
    shadowColor: "#000", // Color of the shadow
    shadowOffset: { width: 0, height: 4 }, // Increase the vertical offset
    shadowOpacity: 0.3, // Slightly higher opacity for a more noticeable shadow
    shadowRadius: 6, // Increase the blur radius for a more diffused shadow
    // Elevation for Android
    elevation: 8, // Higher elevation for a deeper shadow
  },

  title: {
    width: "100%",
    textAlign: "center",
    paddingVertical: 5,
    fontFamily: "San Francisco",
    fontWeight: "700",
    fontSize: 18,
  },
  progressBarContainer: {
    flexDirection: "row",

    justifyContent: "space-evenly",
  },
});
export default SinglePlantMonitor;
